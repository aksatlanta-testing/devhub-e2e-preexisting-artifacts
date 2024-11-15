
{{- define "go-echo6533a7c2-5827-4a4c-bc56-b0a119baaaeb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6533a7c2-5827-4a4c-bc56-b0a119baaaeb.fullname" -}}
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


{{- define "go-echo6533a7c2-5827-4a4c-bc56-b0a119baaaeb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6533a7c2-5827-4a4c-bc56-b0a119baaaeb.labels" -}}
helm.sh/chart: {{ include "go-echo6533a7c2-5827-4a4c-bc56-b0a119baaaeb.chart" . }}
{{ include "go-echo6533a7c2-5827-4a4c-bc56-b0a119baaaeb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6533a7c2-5827-4a4c-bc56-b0a119baaaeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6533a7c2-5827-4a4c-bc56-b0a119baaaeb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}