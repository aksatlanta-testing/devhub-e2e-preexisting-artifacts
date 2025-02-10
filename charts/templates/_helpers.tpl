
{{- define "go-echo4e8c1820-4770-40ed-b9ac-a38667137644.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4e8c1820-4770-40ed-b9ac-a38667137644.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo4e8c1820-4770-40ed-b9ac-a38667137644.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4e8c1820-4770-40ed-b9ac-a38667137644.labels" -}}
helm.sh/chart: {{ include "go-echo4e8c1820-4770-40ed-b9ac-a38667137644.chart" . }}
{{ include "go-echo4e8c1820-4770-40ed-b9ac-a38667137644.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4e8c1820-4770-40ed-b9ac-a38667137644.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4e8c1820-4770-40ed-b9ac-a38667137644.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}