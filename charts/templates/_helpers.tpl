
{{- define "go-echodfa15f4f-0ccd-4927-b442-f5e31b946560.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfa15f4f-0ccd-4927-b442-f5e31b946560.fullname" -}}
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


{{- define "go-echodfa15f4f-0ccd-4927-b442-f5e31b946560.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfa15f4f-0ccd-4927-b442-f5e31b946560.labels" -}}
helm.sh/chart: {{ include "go-echodfa15f4f-0ccd-4927-b442-f5e31b946560.chart" . }}
{{ include "go-echodfa15f4f-0ccd-4927-b442-f5e31b946560.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodfa15f4f-0ccd-4927-b442-f5e31b946560.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodfa15f4f-0ccd-4927-b442-f5e31b946560.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}