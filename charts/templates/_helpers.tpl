
{{- define "go-echoe5ce5b23-b9e6-4818-a181-67bf2cf7550d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5ce5b23-b9e6-4818-a181-67bf2cf7550d.fullname" -}}
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


{{- define "go-echoe5ce5b23-b9e6-4818-a181-67bf2cf7550d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5ce5b23-b9e6-4818-a181-67bf2cf7550d.labels" -}}
helm.sh/chart: {{ include "go-echoe5ce5b23-b9e6-4818-a181-67bf2cf7550d.chart" . }}
{{ include "go-echoe5ce5b23-b9e6-4818-a181-67bf2cf7550d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5ce5b23-b9e6-4818-a181-67bf2cf7550d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5ce5b23-b9e6-4818-a181-67bf2cf7550d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}