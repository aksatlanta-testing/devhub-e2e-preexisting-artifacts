
{{- define "go-echoe0431329-ccc6-42e0-b079-0bab804b80c7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0431329-ccc6-42e0-b079-0bab804b80c7.fullname" -}}
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


{{- define "go-echoe0431329-ccc6-42e0-b079-0bab804b80c7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0431329-ccc6-42e0-b079-0bab804b80c7.labels" -}}
helm.sh/chart: {{ include "go-echoe0431329-ccc6-42e0-b079-0bab804b80c7.chart" . }}
{{ include "go-echoe0431329-ccc6-42e0-b079-0bab804b80c7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe0431329-ccc6-42e0-b079-0bab804b80c7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe0431329-ccc6-42e0-b079-0bab804b80c7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}