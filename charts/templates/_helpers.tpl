
{{- define "go-echo76280bbb-8cf7-4e0f-8ab1-a62d7f38572a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76280bbb-8cf7-4e0f-8ab1-a62d7f38572a.fullname" -}}
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


{{- define "go-echo76280bbb-8cf7-4e0f-8ab1-a62d7f38572a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76280bbb-8cf7-4e0f-8ab1-a62d7f38572a.labels" -}}
helm.sh/chart: {{ include "go-echo76280bbb-8cf7-4e0f-8ab1-a62d7f38572a.chart" . }}
{{ include "go-echo76280bbb-8cf7-4e0f-8ab1-a62d7f38572a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo76280bbb-8cf7-4e0f-8ab1-a62d7f38572a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo76280bbb-8cf7-4e0f-8ab1-a62d7f38572a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}