
{{- define "go-echof73173d9-0e7a-4855-9050-b629be0f67aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof73173d9-0e7a-4855-9050-b629be0f67aa.fullname" -}}
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


{{- define "go-echof73173d9-0e7a-4855-9050-b629be0f67aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof73173d9-0e7a-4855-9050-b629be0f67aa.labels" -}}
helm.sh/chart: {{ include "go-echof73173d9-0e7a-4855-9050-b629be0f67aa.chart" . }}
{{ include "go-echof73173d9-0e7a-4855-9050-b629be0f67aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof73173d9-0e7a-4855-9050-b629be0f67aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof73173d9-0e7a-4855-9050-b629be0f67aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}