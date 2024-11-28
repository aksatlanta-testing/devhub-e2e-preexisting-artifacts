
{{- define "go-echo2912bfbf-902f-4245-acb5-396aca7e1efc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2912bfbf-902f-4245-acb5-396aca7e1efc.fullname" -}}
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


{{- define "go-echo2912bfbf-902f-4245-acb5-396aca7e1efc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2912bfbf-902f-4245-acb5-396aca7e1efc.labels" -}}
helm.sh/chart: {{ include "go-echo2912bfbf-902f-4245-acb5-396aca7e1efc.chart" . }}
{{ include "go-echo2912bfbf-902f-4245-acb5-396aca7e1efc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2912bfbf-902f-4245-acb5-396aca7e1efc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2912bfbf-902f-4245-acb5-396aca7e1efc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}