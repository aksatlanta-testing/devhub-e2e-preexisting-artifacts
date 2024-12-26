
{{- define "go-echo23653505-46fb-45cc-b0ed-bf018ece3ede.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23653505-46fb-45cc-b0ed-bf018ece3ede.fullname" -}}
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


{{- define "go-echo23653505-46fb-45cc-b0ed-bf018ece3ede.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23653505-46fb-45cc-b0ed-bf018ece3ede.labels" -}}
helm.sh/chart: {{ include "go-echo23653505-46fb-45cc-b0ed-bf018ece3ede.chart" . }}
{{ include "go-echo23653505-46fb-45cc-b0ed-bf018ece3ede.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo23653505-46fb-45cc-b0ed-bf018ece3ede.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo23653505-46fb-45cc-b0ed-bf018ece3ede.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}