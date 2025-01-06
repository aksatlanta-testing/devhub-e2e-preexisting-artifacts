
{{- define "go-echodde3049c-648e-405c-a864-5e8c2b5baad4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodde3049c-648e-405c-a864-5e8c2b5baad4.fullname" -}}
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


{{- define "go-echodde3049c-648e-405c-a864-5e8c2b5baad4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodde3049c-648e-405c-a864-5e8c2b5baad4.labels" -}}
helm.sh/chart: {{ include "go-echodde3049c-648e-405c-a864-5e8c2b5baad4.chart" . }}
{{ include "go-echodde3049c-648e-405c-a864-5e8c2b5baad4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodde3049c-648e-405c-a864-5e8c2b5baad4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodde3049c-648e-405c-a864-5e8c2b5baad4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}