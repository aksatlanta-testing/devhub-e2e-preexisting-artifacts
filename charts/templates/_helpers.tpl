
{{- define "go-echod2f82169-62cb-4ff6-b3d9-63ea3722e476.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2f82169-62cb-4ff6-b3d9-63ea3722e476.fullname" -}}
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


{{- define "go-echod2f82169-62cb-4ff6-b3d9-63ea3722e476.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2f82169-62cb-4ff6-b3d9-63ea3722e476.labels" -}}
helm.sh/chart: {{ include "go-echod2f82169-62cb-4ff6-b3d9-63ea3722e476.chart" . }}
{{ include "go-echod2f82169-62cb-4ff6-b3d9-63ea3722e476.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2f82169-62cb-4ff6-b3d9-63ea3722e476.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2f82169-62cb-4ff6-b3d9-63ea3722e476.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}