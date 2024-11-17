
{{- define "go-echoddc03863-d108-46a4-942a-0575c1e30df9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoddc03863-d108-46a4-942a-0575c1e30df9.fullname" -}}
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


{{- define "go-echoddc03863-d108-46a4-942a-0575c1e30df9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoddc03863-d108-46a4-942a-0575c1e30df9.labels" -}}
helm.sh/chart: {{ include "go-echoddc03863-d108-46a4-942a-0575c1e30df9.chart" . }}
{{ include "go-echoddc03863-d108-46a4-942a-0575c1e30df9.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoddc03863-d108-46a4-942a-0575c1e30df9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoddc03863-d108-46a4-942a-0575c1e30df9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}