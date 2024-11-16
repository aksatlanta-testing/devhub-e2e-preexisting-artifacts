
{{- define "go-echob3263819-c848-49c5-9221-cebd24edee0b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3263819-c848-49c5-9221-cebd24edee0b.fullname" -}}
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


{{- define "go-echob3263819-c848-49c5-9221-cebd24edee0b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3263819-c848-49c5-9221-cebd24edee0b.labels" -}}
helm.sh/chart: {{ include "go-echob3263819-c848-49c5-9221-cebd24edee0b.chart" . }}
{{ include "go-echob3263819-c848-49c5-9221-cebd24edee0b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob3263819-c848-49c5-9221-cebd24edee0b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob3263819-c848-49c5-9221-cebd24edee0b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}